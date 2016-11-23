# $Author: pradeep9873 $
# $Header: http://172.17.98.25/svn/PAS/trunk/majesco-policy/LifeCycleSupport/Build/shouldPackageDBScript.pl 25766 2016-04-18 05:50:30Z pradeep9873 $
# $URL: http://172.17.98.25/svn/PAS/trunk/majesco-policy/LifeCycleSupport/Build/shouldPackageDBScript.pl $
# $Revision: 25766 $
# $LastChangedDate: 2016-04-18 11:20:30 +0530 (Mon, 18 Apr 2016) $
# $Id: shouldPackageDBScript.pl 25766 2016-04-18 05:50:30Z pradeep9873 $
use strict;
use warnings;
use Compare;
my $userVersion   = $ARGV[0];
my $scriptVersion = $ARGV[1];
open (DEBUGFILE, '>>shouldPackageDBScriptDEBUG.txt');

print DEBUGFILE "userVersion = $userVersion\n";
print DEBUGFILE "scriptVersion = $scriptVersion\n";

if(&Version::Compare::version_compare($scriptVersion,$userVersion) == 1 )  {
   
    print "true";
    print DEBUGFILE "true\n";
}
else
{
    print "false";
    print DEBUGFILE "false\n";
}

close (DEBUGFILE);