SDG sdg = null;
if (sdgCache.containsKey(func)) {
    sdg = sdgCache.get(func);
} else {
    try {
        String entryClass = "L" + func.className.replace('.', '/');
        String entryMethod = func.methodName;
        String entrySig = func.methodSig;
        config.entry = findMethod(config, entryClass, entryMethod, entrySig);
        sdg = SDGBuilder.build(config, new SliceMonitor());
        CSDGPreprocessor.preprocessSDG(sdg);
        sdgCache.put(func, sdg);
        LOGGER.info("Computing Slice...");
    } catch (Exception e) {
        throw new SlicerException(e.getMessage(), e);
    }
}
JoanaSDGSlicer jSlicer = new JoanaSDGSlicer(sdg);
HashSet<SDGNode> sinkNodes = jSlicer.getNodesAtLocation(line);
Collection<SDGNode> slice = jSlicer.slice(sinkNodes);
List<SDGNode> sortedSlice = new ArrayList<>(slice);
sortedSlice.sort(Comparator.comparingInt(SDGNode::getId));
StringBuilder result = new StringBuilder();
for (SDGNode node : sortedSlice) {
    result.append(node+" :: "+node.getKind()+" :: "+node.getOperation()
            +" :: "+node.getType()+" :: "+node.getLabel()+"\n");
}
String sliceStr = result.toString();
