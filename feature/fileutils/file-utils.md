Collection of methods for manipulating files and directories. Most commonly used for installation scripts and Rake tasks. 

Most methods take two parameters, 
1. `src`: a single filename or an array of files
2. `dest`: a directory

Options:
- `:verbose`: traces execution of each function to STDERR
- `:noop`: Doesn't actually perform the action, useful for testing
- `:force`: Override the default conservative behavior
- `:preserve`: Preserve the atime, mtime, adn mode information from `src` in `dest`.

In addition, `FileUtils` contain three sub-modules with different default options. 
1. `FileUtils::Verbose`: `:verbose` option is set
2. `FileUtils::NoWrite`: `:noop` option is set
3. `FileUtils::DryRun`: both `:verbose` and `:noop` options are set

```ruby
  require 'fileutils'

  FileUtils.cd(dir, **options)
  FileUtils.cd(dir, **options) {|dir| block }
  FileUtils.pwd()
  FileUtils.mkdir(dir, **options)
  FileUtils.mkdir(list, **options)
  FileUtils.mkdir_p(dir, **options)
  FileUtils.mkdir_p(list, **options)
  FileUtils.rmdir(dir, **options)
  FileUtils.rmdir(list, **options)
  FileUtils.ln(target, link, **options)
  FileUtils.ln(targets, dir, **options)
  FileUtils.ln_s(target, link, **options)
  FileUtils.ln_s(targets, dir, **options)
  FileUtils.ln_sf(target, link, **options)
  FileUtils.cp(src, dest, **options)
  FileUtils.cp(list, dir, **options)
  FileUtils.cp_r(src, dest, **options)
  FileUtils.cp_r(list, dir, **options)
  FileUtils.mv(src, dest, **options)
  FileUtils.mv(list, dir, **options)
  FileUtils.rm(list, **options)
  FileUtils.rm_r(list, **options)
  FileUtils.rm_rf(list, **options)
  FileUtils.install(src, dest, **options)
  FileUtils.chmod(mode, list, **options)
  FileUtils.chmod_R(mode, list, **options)
  FileUtils.chown(user, group, list, **options)
  FileUtils.chown_R(user, group, list, **options)
  FileUtils.touch(list, **options)
```