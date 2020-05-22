for (int i = 0; i < sliceProject.getBugInstances().size(); i++) {
    List<Exception> causedExceptions = new LinkedList<>();
    T buginstance = sliceProject.getBugInstance(i);
    List<TaintTreeNode> taintTrees = sliceProject.getTaintProject().getTaintTrees(buginstance);
    boolean instanceIsSafe = true;
    Set<TaintFlow> safeFlows=new HashSet<>();
    for (TaintTreeNode source : taintTrees) {
        boolean treeIsSafe = false;
        Set<TaintFlow> flow = sliceProject.getTaintFlows(source);
        if (flow == null) {
            causedExceptions.add(new NotFoundException(source, sliceProject));
            continue;
        }
        if (flow.isEmpty()){
            treeIsSafe=true;
        } else {
            for (TaintFlow subFlow : flow) {
                boolean bFlowIsSafe = false;
                bFlowIsSafe = flowIsSafe(subFlow);
                if (bFlowIsSafe){
                    treeIsSafe=true;
                    safeFlows.add(subFlow);
                    break;
                }
            }
        }
        instanceIsSafe = instanceIsSafe & treeIsSafe;
    }
    predictProject.putProofs(buginstance, safeFlows);
    predictProject.putPrediction(sliceProject.getBugInstances().get(i), instanceIsSafe);
}
