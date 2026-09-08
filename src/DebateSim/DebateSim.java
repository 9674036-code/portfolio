import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

public class DebateSim {
    public static String paradigm="Hello, if you are reading this, I am probably your judge, here's what I'm looking for: ";
    public static Random random=new Random();
    public static Scanner input=new Scanner(System.in);
    public static ArrayList<Integer> judge = new ArrayList<>();
    public static String[] iCalc ={"I like seeing clash and impact calc. ","Clash and impact calc are very important for me. ","Impact calc is how debate works and will win/lose you the round. "};
    public static String[] value={"The value debate is pretty fundamental but not really extensive so I'll be a judging a bit of the round on it. ","The value debate is quite fundamental so I'll weigh it considerably. ","Impact calc is important, but the value debate is cool so I will weigh most of the round on it. "};
    public static ArrayList<ArrayList<Debater>> allDebaters = new ArrayList<>();
    public static ArrayList<Integer>types=new ArrayList<>();

    public static void main(String[] args) {
        System.out.println("\nInput \"q\" at anytime to exit the application\n");
        types.add(0);
        types.add(0);
        allDebaters.add(new ArrayList<>());
        allDebaters.add(new ArrayList<>());
        allDebaters.get(0).add(new ExtinctionDebater(0,0));
        allDebaters.get(0).add(new ProgDebater(0,0));
        allDebaters.get(0).add(new SVDebater(0,0));
        allDebaters.get(1).add(new ExtinctionDebater(0,0));
        allDebaters.get(1).add(new ProgDebater(0,0));
        allDebaters.get(1).add(new SVDebater(0,0));
        types.set(1,random.nextInt(2));
        while (true){
            for (int r=0;r<5;r++){
                judge.add(random.nextInt(60)+10);
                allDebaters.get(1).get(types.get(1)).setMainArg(judge.get(0)+random.nextInt(18)-8);
                if(judge.get(0)>31){
                    judge.add(random.nextInt(60-(judge.get(0)-30))+10);
                }else{
                    judge.add(random.nextInt(60)+10);
                }
                allDebaters.get(1).get(types.get(1)).setValue(judge.get(1)+random.nextInt(18)-8);
                judge.add(100-judge.get(0)-judge.get(1));
                allDebaters.get(1).get(types.get(1)).setCrossX(100-allDebaters.get(1).get(types.get(1)).getMainArg()-allDebaters.get(1).get(types.get(1)).getValue());

                judge.add(random.nextInt(50)+10);
                judge.add((int)(random.nextDouble()*3));

                if(judge.get(0)>57){
                    paradigm=paradigm+iCalc[2];
                }else if(judge.get(0)>45){
                    paradigm=paradigm+iCalc[1];
                }else if(judge.get(0)>33){
                    paradigm=paradigm+iCalc[0];
                }
                if(judge.get(1)>57){
                    paradigm=paradigm+value[2];
                }else if(judge.get(1)>45){
                    paradigm=paradigm+value[1];
                }else if(judge.get(1)>33){
                    paradigm=paradigm+value[0];
                }
                if(judge.get(2)<29&&random.nextInt(2)==1||judge.get(2)>41&&random.nextInt(10)==0){
                    paradigm=paradigm+"Also, I will be playing Clash of Clans during Cross-ex. ";
                }

                if (paradigm.equals("Hello, if you are reading this, I am probably your judge, here's what I'm looking for:")){
                    System.out.println("Paradigm: (the standards the judge will weigh the debate on) \n"+paradigm+"Do whatever you guys want.\n");
                }
                System.out.println("Paradigm: (the standards the judge will weigh the debate on) \n"+paradigm+"\n");

                while(true){    
                    try{
                        int oldType=types.get(0);
                        System.out.println("Choose a debating style using one of the displayed integers: 1: Extinction links 2: Structural violence 3: Progressive kritiques and theory");
                        types.set(0,checkLine()-1);
                        if (types.get(0)>2 || types.get(0)<0){
                            throw new IndexOutOfBoundsException("Number is out of range.");
                        }
                        System.out.println("How many points out of 100 of prepatory time do you wish to allocate to your value framework? (you will be splitting these points three ways) ");
                        allDebaters.get(0).get(types.get(0)).setValue(checkLine());
                        System.out.println("How many points out of 100 of prepatory time do you wish to allocate towards Cross Examination? (you will be splitting these points three ways) ");
                        allDebaters.get(0).get(types.get(0)).setCrossX(checkLine());
                        System.out.println("How many points out of 100 of prepatory time do you wish to allocate to your main argument and impact calculus? (you will be splitting these points three ways) ");
                        allDebaters.get(0).get(types.get(0)).setMainArg(checkLine());
                        if(allDebaters.get(0).get(types.get(0)).getCrossX()+allDebaters.get(0).get(types.get(0)).getMainArg()+allDebaters.get(0).get(types.get(0)).getValue()==100 && allDebaters.get(0).get(types.get(0)).getCrossX()!=0&&allDebaters.get(0).get(types.get(0)).getMainArg()!=0&&allDebaters.get(0).get(types.get(0)).getValue()!=0){
                            allDebaters.get(0).get(types.get(0)).setWins(allDebaters.get(0).get(oldType).getWins());
                            allDebaters.get(0).get(types.get(0)).setSpeakerP(allDebaters.get(0).get(oldType).getSpeakerP());
                            break;
                        }
                        System.out.println("please use a valid integer and ensure your inputted values sum to 100");
                    }catch(NumberFormatException | IndexOutOfBoundsException e){
                        System.out.println("please use a valid integer and ensure your inputted values sum to 100");
                    }
                }
                for (int i =0; i<2;i++){
                    allDebaters.get(i).get(types.get(i)).addPerks();
                }
                
                System.out.println("\nJudge importance ratings (out of 100):");
                System.out.println("The main arguments/impact calc :" +judge.get(0));
                System.out.println("The value debate: " +judge.get(1));
                System.out.println("Cross Examination: " +judge.get(2));

                System.out.println("\nOpponent's selected importance ratings (out of 100)");
                System.out.println("The main arguments/impact calc :" +allDebaters.get(1).get(types.get(1)).getMainArg());
                System.out.println("The value debate: " +allDebaters.get(1).get(types.get(1)).getValue());
                System.out.println("Cross Examination: " +allDebaters.get(1).get(types.get(1)).getCrossX()+"\n");

                System.out.println(effectCalc(allDebaters.get(0).get(types.get(0)).getMainArg(),judge.get(0)));
                System.out.println(effectCalc(allDebaters.get(0).get(types.get(0)).getValue(),judge.get(1)));
                System.out.println(effectCalc(allDebaters.get(0).get(types.get(0)).getCrossX(),judge.get(2)));
                System.out.println(effectCalc(allDebaters.get(1).get(types.get(1)).getCrossX(),judge.get(2)));
                System.out.println(effectCalc(allDebaters.get(1).get(types.get(1)).getMainArg(),judge.get(0)));
                System.out.println(effectCalc(allDebaters.get(1).get(types.get(1)).getValue(),judge.get(1)));

                
                if(effectCalc(allDebaters.get(0).get(types.get(0)).getCrossX(),judge.get(2)+effectCalc(allDebaters.get(0).get(types.get(0)).getMainArg(),judge.get(0))+effectCalc(allDebaters.get(0).get(types.get(0)).getValue(),judge.get(1)))>effectCalc(allDebaters.get(1).get(types.get(1)).getCrossX(),judge.get(2))+effectCalc(allDebaters.get(1).get(types.get(1)).getMainArg(),judge.get(0))+effectCalc(allDebaters.get(1).get(types.get(1)).getValue(),judge.get(1))){
                    System.out.println("You have won the round.\n");
                    allDebaters.get(0).get(types.get(0)).setWins(1);
                }else{
                    System.out.println("You have lost the round.\n");
                }

                judge.clear();
                paradigm="Hello, if you are reading this, I am probably your judge, here's what I'm looking for: ";
            }
        switch(allDebaters.get(0).get(types.get(0)).getWins()){
            case 4:
                System.out.println("You placed "+random.nextInt(2)+4+"th");
            case 5:
                System.out.println("You placed"+random.nextInt(3)+1+"th");
            default:
                System.out.println("You did not place.");
        }

        System.out.println("Do you want to play again? yes/no ");
        if(input.nextLine().equals("no")){
            System.out.println("Ok bye bye");
            input.close();
            break;
        }
        allDebaters.get(0).get(types.get(0)).reset();
        }
    }
    public static int effectCalc(int j, int p){
        return (j*p)*(Math.abs(p/j-1)+1);
    }
    public static int checkLine(){
        String line=input.nextLine();
        if (line.equals("q")||line.equals("Q")){
            System.out.println("Ok bye bye");
            input.close();
            System.exit(0);
        }
        return(Integer.parseInt(line));
    }
}
