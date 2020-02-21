taintProject = reportParser.rep2taintProject(monitor);
try {
    slicer.config(taintProject.getAppJars(), taintProject.getLibJars(), null);
    monitor.process(1, 1, null, null, null);
} catch (ClassHierarchyException | IOException e) {
    monitor.process(1, 1, null, null, e);
}
monitor.init("Slice", taintProject.getTaintTreeMap().size());
project = new SliceProject<>(taintProject);
for (int i = 0; i < taintProject.getBugInstances().size(); i++) {
    List<TreeNode> taintTrees = taintProject.getTaintTrees(
            taintProject.getBugInstances().get(i));
    if (taintTrees == null) {
        continue;
    }
    String slice = null;
    for (TreeNode node : taintTrees) {
        try {
            sliceTaintTree(node);
        } catch (SlicerException e) {
            LOGGER.error(ExceptionUtil.getStackTrace(e.getRawException()));
        }
    }
    monitor.process(i + 1, taintProject.getBugInstances().size(),
            taintTrees, slice, exception);
    if (slicer instanceof JoanaSlicer){
        ((JoanaSlicer) slicer).clearCache();
    }
}
return project;
