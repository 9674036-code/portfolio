public class ProgDebater extends Debater{
    public static final int SPEAKER_I=50;
    public ProgDebater(int w,int p) {
        setMod(8);
        setWins(w);
        setSpeakerP(p);
    }
    @Override
    public void addPerks(){
        setValue(getValue()+getMod());
    }
}
