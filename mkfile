</$objtype/mkfile

TARG=gmake

OFILES= \
ar.$O \
arscan.$O \
commands.$O \
default.$O \
dir.$O \
expand.$O \
file.$O \
function.$O \
getopt.$O \
getopt1.$O \
guile.$O \
hash.$O \
implicit.$O \
job.$O \
load.$O \
loadapi.$O \
main.$O \
misc.$O \
output.$O \
read.$O \
remake.$O \
rule.$O \
signame.$O \
strcache.$O \
variable.$O \
version.$O \
vpath.$O \
fnmatch.$O \
glob.$O \
alloca.$O \
posixos.$O

HFILES= \
commands.h \
debug.h \
dep.h \
filedef.h \
getopt.h \
gettext.h \
hash.h \
job.h \
makeint.h \
os.h \
output.h \
rule.h \
variable.h \
fnmatch.h \
glob.h


BIN=/$objtype/bin/

</sys/src/cmd/mkone

CC=pcc
LD=pcc
CFLAGS=-c -p -B -I. -I./lib -I./src -I/sys/include/ape -I/$objtype/include/ape -DPLAN9 -DHAVE_CONFIG_H \
	-D_LIMITS_EXTENSION -DHAVE_SYS_RESOURCE_H -DHAVE_STRCASECMP -DHAVE_STRNCASECMP \
	-DHAVE_SETLOCALE -DHAVE_FILENO -D_POSIX_SOURCE -D_SUSV2_SOURCE -D_RESEARCH_SOURCE -D_BSD_EXTENSION -D_C99_SNPRINTF_EXTENSION


%.$O: lib/%.c
	$CC $CFLAGS lib/$stem.c
	
%.$O: src/%.c
	$CC $CFLAGS src/$stem.c


clean:V:
	rm -f [$OS].* *.[$OS] $CLEANFILES

nuke:V:
	rm -f *.[$OS] y.tab.? y.debug y.output [$OS].$TARG $TARG
	rm -f /sys/man/1/gmake

install:V:
	cp doc/make.1 /sys/man/1/gmake

