public void sliceTaintTree(TaintTreeNode source) throws SlicerException {
    Set<TaintFlow> flows = new DFSTaintTree().getTaintFlows(source);
    project.source2taintFlow.put(source, flows);
    for (TaintFlow edge : flows) {
        sliceFlow(edge);
    }
}
public String sliceFlow(Func func, Location location) throws SlicerException {
    String slice = project.getSlice(func, location);
    if (slice != null) {
        return slice;
    } else {
        slice = slicer.computeSlice(func, location);
        project.putSlice(func, location, slice);
        return slice;
    }
}
