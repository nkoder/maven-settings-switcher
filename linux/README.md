Maven settings switcher
=======================

Do you need to switch between many Maven settings files? Try `mvs`.

**nkoder: tested under Cygwin64 on Windows 8.1**

## Usage

### Store a settings file

**nkoder: this one doesn't work on my environment so I just copy settings files to .mvn-settings/files**

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

The provided `Rakefile` has an `install` task which copies `mvs` to `/usr/bin` and `mvs.bash` to `/etc/bash_completion.d`.
```
sudo rake install
```

## Operation

`mvs` stores the settings files in `~/.mvn-settings/files`.

Beware that `mvs` is absolutely **not** foolproof. Use with caution.
It will most likely only work on Linux because it uses the `fcntl` POSIX system call.
