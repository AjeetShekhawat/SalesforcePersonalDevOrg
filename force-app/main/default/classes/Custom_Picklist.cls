public class Custom_Picklist
{
    public String count1 { get;set;}
    public String count2 { get;set;}
    public String Domain { get; set; }
    public String message {get;set;}
    public List<SelectOption> numberOfQuestions {get;set;}
    public String selected {get;set;}
    public Custom_Picklist()
    {
        message='';
        
        this.getnumberOfQuestions();
    }
    
    public List<SelectOption> getnumberOfQuestions()
    {
        numberOfQuestions = new List<SelectOption>();
        numberOfQuestions.add(new SelectOption('','--None--'));
        numberOfQuestions.add(new SelectOption('5','5'));
        numberOfQuestions.add(new SelectOption('10','10'));
        numberOfQuestions.add(new SelectOption('20','20'));
        numberOfQuestions.add(new SelectOption('30','30'));
        return  numberOfQuestions;
    }
    
    public void showQuestions()
    {
        if(Domain == 'Salesforce')
        {
            message = Domain + '_' + count1;
            Domain =null;
        }
        else if(Domain == 'PHP')
        {
            message = Domain + '_' + count2;
            Domain =null;
        }
        
    }
}