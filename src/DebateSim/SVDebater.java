public class SVDebater extends Debater{
    public static final int SPEAKER_I=80;
    public SVDebater(int w,int p) {
        setMod(17);
        setWins(w);
        setSpeakerP(p);
    }
    @Override
    public void addPerks(){
        setValue(getValue()+getMod());
    }
}
