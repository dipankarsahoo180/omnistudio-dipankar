global class OmnistudioRemoteActionClass implements omnistudio.VlocityOpenInterface2 {
    
    global Object invokeMethod(String methodName, Map<String,Object> input, Map<String,Object> output, Map<String,Object> options){
        if(methodName == 'getFilteredContacts'){
            String accId = (String)input.get('AccountId');
            String fName =  (String)input.get('FirstName');
            output.put('InputValues', accId+'_'+fName);
            output.put('FilteredContacts',getFilteredCOntacts( accId, fname));
        }
        return NULL;
    }
    public static List<Contact> getFilteredCOntacts(String accId,String fname){
        return [Select Id,FirstName,LastName,Email,Phone from Contact where AccountId =:accId AND FirstName =:fname];
}
}