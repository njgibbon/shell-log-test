//find the project directory so we can path relaitvely
def groovyUtils = new com.eviware.soapui.support.GroovyUtils(context)
def projectDir = groovyUtils.projectPath

//log where we are
log.info( "Test 1 - Log Extraction")
log.info(projectDir)

//Set Up
def assertAgainstLogCmd;
def p;

//prepare statement to execute
logExtractCmd = [projectDir+'/extractLog.sh', "001", projectDir]

log.info (logExtractCmd)

//execute statement
p = logExtractCmd.execute()
p.waitForOrKill(10000)

//clear up
log.info (p.in.text)
log.info (p.err.text)
