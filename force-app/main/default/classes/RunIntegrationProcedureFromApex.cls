public with sharing class RunIntegrationProcedureFromApex {
    
    public static Map<String, Object> callIntergrationprocedure(String AccountId,String FirstName,String procedureName){
		/* Initialize variables */
        Map<String, Object> ipInput = new Map<String, Object>();
        Map<String, Object> ipOptions = new Map<String, Object>();
        Map<String, Object> ipOutput = new Map<String, Object>();
        
        /* Populating input map for an Integration Procedure. Follow whatever structure your VIP expects */
        ipInput.put('AccountId', AccountId);
        ipInput.put('FirstName', FirstName);

        /* Call the IP via runIntegrationService, and save the output to ipOutput */
        ipOutput = (Map<String, Object>) omnistudio.IntegrationProcedureService.runIntegrationService (procedureName, ipInput, ipOptions);
        System.debug(JSON.serializePretty(ipOutput.get('StepData')));
        return (Map<String,Object>)ipOutput.get('StepData');
    }
}