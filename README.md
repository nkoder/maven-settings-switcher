Maven settings switcher
=======================

Do you need to switch between many Maven settings files? Try `mvs`.

### Store `nexus-settings.xml` and name it `nexus`
```
cat nexus-settings.xml | mvs nexus
```

### Switch to the new `nexus` file
```
mvs nexus
```

### Show name of current settings file
```
mvs
```

### List stored settings files
```
mvs -l
```

## Installation

1. Rename `mvs.rb` to `mvs` and ensure it is somewhere on `PATH`.
2. Copy mvs.bash to /etc/bash_completion.d/

`mvs` stores the settings files in `~/.mvn-settings/files`.