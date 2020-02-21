protected Class<?> findClass(final String name) {
    String targetFile = name.replace(".", "/") + ".class";
    byte[] classByte = null;
    for (File file : classpaths) {
        ZipFile zipFile = new ZipFile(file);
        Enumeration<?> entries = zipFile.getEntries();
        while (entries.hasMoreElements()) {
            ZipEntry entry = (ZipEntry) entries.nextElement();
            if (entry.getName().endsWith(".class") && entry.getName().endsWith(targetFile)) {
                try {
                    /* read zip entry to classByte */
                } catch (IOException e) {
                    e.printStackTrace();
                }
                break;
            }
        }
    }
    if (classByte == null) { throw new ClassNotFoundException(name); }
    return defineClass(name, classByte, 0, classByte.length);
}
