TaintFlowGraph taintFlowGraph = new TaintFlowGraph();
// 加入调用敏感函数的边
AbstractInjectionDetector injDetector = (AbstractInjectionDetector) detector;
taintFlowGraph.addEdge(sinkCaller,
        new Edge(sinkMethod,
            SourceLineAnnotation.fromVisitedInstruction(classContext,
                method,
                instructionHandle),
            Edge.SINK_EDGE,
            0));
// 增加函数调用位置
for (Location location : locations) {
    MethodDescriptor caller = location.getMethodDescriptor();
    MethodDescriptor callee = injDetector.loc2callee.get(location);
    SourceLineAnnotation src =
        SourceLineAnnotation.fromVisitedInstruction(
                location.getMethodDescriptor(), location.getPosition());
    taintFlowGraph.addEdge(caller, callee, src, key.getOrderedId());
}
// 附加返回语句位置
for(MethodDescriptor method : injDetector.returns.keySet()){
    for(Edge edge: locations.get(method)){
        taintFlowGraph.addEdge(method, edge);
    }
}
