//find the project directory so we can path relaitvely
def groovyUtils = new com.eviware.soapui.support.GroovyUtils(context)
def projectDir = groovyUtils.projectPath

//log where we are
log.info( "Test 1 - Assertion Against Log")
log.info(projectDir)

//Set Up
def result = ""
def assertAgainstLogCmd;
def p;
def pExitValue;

//prepare statement to execute
assertAgainstLogCmd = [projectDir+'/assertAgainstLog.sh', "SUCCESS", projectDir]

log.info (assertAgainstLogCmd)

//execute statement
p = assertAgainstLogCmd.execute()
p.waitForOrKill(10000)

//clear up
pExitValue = p.exitValue();
log.info(pExitValue);
log.info (p.in.text)
log.info (p.err.text)

//assert
assert pExitValue == 0
