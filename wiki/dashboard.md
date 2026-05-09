---
title: "Wiki Dashboard"
type: brief
tags: [dashboard]
keywords: [dashboard, overview, stats]
related:
  - 
maturity: core
created: 2026-05-06
updated: 2026-05-10
---

## Relations


## Wiki Dashboard

### Stats (auto-generated via Dataview)

```dataview
TABLE WITHOUT ID
  length(rows) as "Pages",
  date(cols.created) as "Created"
FROM #source OR #entity OR #concept OR #brief
WHERE !contains(file.path, "index") AND !contains(file.path, "log") AND !contains(file.path, "dashboard")
GROUP BY file.folder
```

### All Pages by Maturity

```dataview
TABLE file.name as "Page", type, maturity, file.mtime as "Updated"
FROM "wiki/"
WHERE maturity
SORT maturity ASC, file.mtime DESC
```

### Orphan Check (pages with no inbound links)

```dataview
TABLE file.name as "Orphan Page", type
FROM "wiki/"
WHERE !file.outlinks OR (length(file.outlinks) = 0 AND length(file.inlinks) = 0)
AND file.name != "index" AND file.name != "log" AND file.name != "dashboard"
```

### Recently Updated

```dataview
TABLE file.name as "Page", type, file.mtime as "Modified"
FROM "wiki/"
WHERE file.mtime > date(today) - dur(7)
AND file.name != "index" AND file.name != "log" AND file.name != "dashboard"
SORT file.mtime DESC
```

### Source Pages — Read Status

```dataview
TABLE file.name as "Page", read_status as "Status", maturity
FROM "wiki/sources/"
WHERE read_status
SORT read_status ASC
```

### Needs Verification

```dataview
TABLE file.name as "Page", regexreplace(file.content, ".*\\Q\\[NEEDS VERIFICATION ([0-9-]+)\\].*", "$1") as "Since"
FROM "wiki/"
WHERE contains(file.content, "[NEEDS VERIFICATION")
```

### By Domain

```dataview
TABLE file.name as "Page", type, maturity
FROM #models OR #adapters OR #training-tools OR #uis OR #marketplaces OR #hardware OR #persona-ops OR #personas OR #techniques OR #workflows OR #ops-strategy
WHERE file.name != "index" AND file.name != "log" AND file.name != "dashboard"
SORT file.folder ASC, file.name ASC
```