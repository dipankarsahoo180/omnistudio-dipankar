public class OmnistudioCustomClass implements callable{
    
    /*
    inputs - arguments - List<Object> of passed in arguments
    output - result - The result of the Function being called. Supports single Object values, List<Object> or Map<String, Object>
    */    
    public Object call(String action, Map<String, Object> args){
        Map<String, Object> input = (Map<String, Object>)args.get('input');
        Map<String, Object> output = (Map<String, Object>)args.get('output');
        Map<String, Object> options = (Map<String, Object>)args.get('options');
        
        if(action == 'customFunction'){
            //To return the result to the dataraptor. the key should always be named as `result`.
            output.put('result',convertToObject(input,output,options));
        }

        return true;
    }
    
    public static List<Object> convertToObject(Map<String, Object> input, Map<String, Object> output,Map<String, Object> options){
        //get the list of arguements from DataRaptor 
        List<Object> arguments = (List<Object>) input.get('arguments');
        String acccId = (String) arguments[0];
        //Incase your argurment contains a list of elements passed using LIST(%listOfElements%)
        Map<String,Object> assetsMap = (Map<String,Object>) arguments[1];
        List<Object> assetList = (List<Object>) assetsMap.get('VLOCITY-FORMULA-LIST');
        List<Map<String,String>> transformedArray = new List<Map<String,String>>();
        For (Object key: assetList){
            transformedArray.add(New Map<String,String>{'asset'=>(String)key});
        }
        return transformedArray;
            
    }
    
}