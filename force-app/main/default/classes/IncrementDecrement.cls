public class IncrementDecrement {
    public Integer inc = 0;
    
    public void setinc(Integer i) {
        this.inc = i;
    }
    public Integer getinc() {
        return inc;
    }
    public PageReference incr() {
        inc += 1;    
    	return null;
    }
    public PageReference decr() {
        inc -= 1;
        return null;
    }
}