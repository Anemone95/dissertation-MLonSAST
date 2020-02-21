public Set<TaintFlow> getTaintFlows(TaintTreeNode source){
    Set<TaintFlow> taintFlow=new HashSet<>();
    boolean hasNext=dfs(source, taintFlow);
    return taintFlow;
}
public boolean dfs(TaintTreeNode source, Set<TaintFlow> taintFlow) {
    boolean hasSink=false;
    TaintTreeNode nextNode = source.firstChildNode;
    while (nextNode!=null) {
        if (nextNode.type == TaintTreeNode.NodeType.METHOD) {
            hasSink=hasSink|dfs(nextNode, taintFlow);
            if (hasSink){
                taintFlow.add(new TaintFlow(((MethodLocation) source.location).func, nextNode.location));
                return hasSink;
            }

        }
        if (nextNode.type == TaintTreeNode.NodeType.SINK) {
            taintFlow.add(new TaintFlow(((MethodLocation) source.location).func, nextNode.location));
            return true;
        }
        if (nextNode.type== TaintTreeNode.NodeType.RETURN){
            if (nextNode.nextSibling==null){
                taintFlow.add(new TaintFlow(((MethodLocation) source.location).func, nextNode.location));
                return hasSink;
            }
        }
        nextNode=nextNode.nextSibling;
    }
    return hasSink;
}
