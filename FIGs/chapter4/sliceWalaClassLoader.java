private void loadAllClasses(
        Collection<ModuleEntry> moduleEntries,
        Map<String, Object> fileContents,
        boolean isJMODType) {
    for (ModuleEntry entry : moduleEntries) {
        /*...*/
        String className = entry.getClassName().replace('.', '/');
        /*...*/
        if (className.contains("/classes/")) {
            className = className.replaceFirst(".*?/classes/", "");
        }
        if (myExclusions != null && myExclusions.contains(className)) {
            continue;
        }
        ShrikeClassReaderHandle entryReader = new ShrikeClassReaderHandle(entry);
        className = 'L' + className;
        try {
            // 使用classloader装载该类
            TypeName T = TypeName.string2TypeName(className);
            if (loadedClasses.get(T) != null) {
                Warnings.add(MultipleImplementationsWarning.create(className));
            } else if (super.getParent() != null && super.getParent().lookupClass(T) != null) {
                Warnings.add(MultipleImplementationsWarning.create(className));
            } else {
                ShrikeClass tmpKlass = new ShrikeClass(reader, this, cha);
                loadedClasses.put(T, new ShrikeClass(entryReader, this, cha));
            }
        } catch (InvalidClassFileException e) { /*...*/ }
    }
}
