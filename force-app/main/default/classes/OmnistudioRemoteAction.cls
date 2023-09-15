global with sharing class OmnistudioRemoteAction implements omnistudio.VlocityOpenInterface{
    
    global Boolean invokeMethod(String methodName, Map<String,Object> inputMap, Map<String,Object> outMap, Map<String,Object> options){
        Boolean result = true;
        try{
            if(methodName.equals('getFilteredContacts')){
                String AccountId = (String)inputMap.get('AccountId');
                String FirstName = (String)inputMap.get('FirstName') != NULL ?(String)inputMap.get('FirstName'):'';
                String ProcedureName = (String)inputMap.get('ProcedureName');
                outMap.put('Key','CustomValue');
                outMap.put('StepData',filterContacts(AccountId,FirstName,ProcedureName));
                
            }
            
        }catch(Exception e){
            result = false;
        }
        return result;
    }
    
    Public static Map<String,Object> filterContacts(String AccountId,String FirstName,String ProcedureName){
        return RunIntegrationProcedureFromApex.callIntergrationprocedure(AccountId,FirstName,ProcedureName);
    }
    
}