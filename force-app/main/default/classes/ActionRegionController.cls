public class ActionRegionController {
    public String selectedValue{get;set;}
    public Boolean state{set;get;}
    public LIST<SelectOption> getpickList() {
            LIST<SelectOption> pickList = new LIST<SelectOption>();
            pickList.add(new SelectOption('-', 'none'));
            pickList.add(new SelectOption('low', 'low'));
            pickList.add(new SelectOption('high', 'high'));
            return pickList;
    }
    public PageReference showField() {
        if(selectedValue == 'high') {
            state = true;
        } else {
            state = false;
        }
        return null;
    }
}