public Set<CGNode> prune(final SDGBuilder.SDGBuilderConfig cfg, final CallGraph cg) {
    Set<CGNode> keep = new HashSet<>();
    Set<CGNode> marked = new HashSet<>();
    Queue<CGNode> queue = new LinkedList<>();
    CGNode head = cg.getFakeRootNode();
    keep.add(head);
    marked.add(head);
    marked.addAll(cg.getEntrypointNodes());
    keep.addAll(cg.getEntrypointNodes());
    queue.addAll(cg.getEntrypointNodes());
    int limit = nodeLimit + keep.size();
    while (!queue.isEmpty()) {
        if (keep.size() >= limit)
            break;
        head = queue.poll();
        keep.add(head);
        for (Iterator<CGNode> it = cg.getSuccNodes(head); it.hasNext(); ) {
            CGNode childNode = it.next();
            if (!marked.contains(childNode)) {
                marked.add(childNode);
                if (cfg.pruningPolicy.check(childNode)) {
                    queue.add(childNode);
                }
            }
        }
    }
    return keep;
}
