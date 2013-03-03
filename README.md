Maven settings switcher
=======================

Do you need to switch between many Maven settings files? Try `mvs`.

## Usage

### Store a settings file
```
cat nexus-settings.xml | mvs nexus
```

### Switch to a file
```
mvs nexus
```

### Show name of current settings
```
mvs
```

### List stored settings files
```
mvs -l
```

## Installation

1. Rename `mvs.rb` to `mvs` and ensure it is somewhere on `PATH`.
2. Copy `mvs.bash` to `/etc/bash_completion.d/`.

## Operation

`mvs` stores the settings files in `~/.mvn-settings/files`.

Beware that `mvs` is absolutely *NOT* foolproof. Use with caution.