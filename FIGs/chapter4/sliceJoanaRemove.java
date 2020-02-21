boolean isRemoveNode(final SDGNode node) {
    return node.getSource() == null || (node.getClassLoader() != null && node.getClassLoader().equals("Primordial"))
            || node.getSr() < 0 || isExcluded(node.getSource()) || node.getLabel().contains("_exception_")
            || node.getLabel().contains("fake")
            || (node.getBytecodeIndex() < -2 && node.getOperation() != SDGNode.Operation.ASSIGN) || isAbstractNode(node) ;
}

boolean isExcluded(final String str) {
    return str.contains("java/lang") || str.contains("java/io") || str.contains("java/util")
            || str.contains("com/ibm/wala") || str.contains("sun/reflect") || str.contains("java/security")
            || str.contains("sun/") || str.contains("javax/servlet");
}

boolean isAbstractNode(SDGNode sdgNode) {
    return sdgNode.getKind().equals(Kind.FORMAL_IN) || sdgNode.getKind().equals(Kind.FORMAL_OUT)
            || sdgNode.getKind().equals(Kind.ACTUAL_IN) || sdgNode.getKind().equals(Kind.ACTUAL_OUT)
            || sdgNode.getLabel().equals("many2many") || sdgNode.getLabel().contains("UNIQ(")
            || sdgNode.getLabel().contains("<init>") || sdgNode.getLabel().equals("immutable");
}
