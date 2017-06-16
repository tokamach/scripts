#!/usr/bin/env ruby

NAME_REGEX = /.+\/(.+)/i
$grand_total = 0

def has_subfolders?(folder)
  Dir.glob(folder + "/*") { |file| if (File.directory? file)
      return true
    end
  }
  return false
end

def re_countfolder(folder, depth)
  subfiles = Dir.glob(folder + '/*')
  total = 0

  subfiles.each do |file|
    count = 0
    if(File.directory? file)
      # its a directory
      if(has_subfolders?(file))
        # find non folders
        count = Dir.entries(file).reject{|entry| entry =~ /^\.{1,2}$/}.count
        total += count
        # it has subdirectories, so we count normal files then recurse
        printf("%s%s/ %i\n", "  " * depth, file.match(NAME_REGEX).captures[0], count)
        re_countfolder(file, depth + 1)
      else
        # it has no subs, so we count the files and print
        count = Dir.entries(file).reject{|entry| entry =~ /^\.{1,2}$/}.count
        total += count
        printf("%s%s: %i\n", "  " * depth, file.match(NAME_REGEX).captures[0], count)
      end
    end
  end

  $grand_total += total
  # we are at the end of our current directory
  # print the total for all subdirectories
  if(ARGV.include? "-t")
    printf("%stotal: %i\n\n", "  " * depth, total)
  else
    printf("\n")
  end
end

if(ARGV.include? "-d")
    FOLDER=ARGV[ARGV.index("-d") + 1]
else
    FOLDER="/Users/tom/Pictures/animu/"
end

re_countfolder(FOLDER, 0)
if(ARGV.include? "-g")
  printf("grand total: %s\n", $grand_total)
end
