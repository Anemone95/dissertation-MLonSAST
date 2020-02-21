Collection<BugInstance> c = bugCollection.getCollection();
List<BugInstance> bugInstances = c.stream()
    .filter(e -> caredVulns.contains(e.getType()) && (!e.isDead())
            && e.getPriority() != Priorities.LOW_PRIORITY)
    .filter(e -> {
        for (BugAnnotation annotation : e.getAnnotations()) {
            if (annotation.toString().equals("Method usage not detected")) {
                return false;
            }
        }
        return true;
    })
.collect(Collectors.toList());
return bugInstances;
