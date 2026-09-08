public class ExtinctionDebater extends Debater{
    public static final int SPEAKER_I=20;
    public ExtinctionDebater(int w, int p) {
        setMod(21);
        setWins(w);
        setSpeakerP(p);
    }
    @Override
    public void addPerks(){
        setMainArg(getMainArg()+getMod());
    }
}
