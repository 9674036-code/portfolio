import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

public class DebateSim {
    public static String paradigm="Hello, if you are reading this, I am probably your judge, here's what I'm looking for: ";
    public static Random random=new Random();
    public static Scanner input=new Scanner(System.in);
    public static ArrayList<Integer> judge = new ArrayList<>();
    public static String[] iCalc ={"I like seeing clash and impact calc.","Clash and impact calc are very important for me.","Impact calc is how debate works and will win/lose you the round."};
    public static String[] value={"The value debate is pretty fundamental but not really extensive so I'll be a judging a bit of the round on it.","The value debate is quite fundamental so I'll weigh it considerably.","Sure impact calc is important, but the value debate is cool so I will weigh most of the round on it."};
    public static ArrayList<Debater> player = new ArrayList<>();
    public static ArrayList<Debater> opp = new ArrayList<>();
    public static int oppType=0;
    public static int playerType=0;
    public static void main(String[] args) {
        player.add(new ExtinctionDebater(0,0));
        player.add(new ProgDebater(0,0));
        player.add(new SVDebater(0,0));
        opp.add(new ExtinctionDebater(0,0));
        opp.add(new ProgDebater(0,0));
        opp.add(new SVDebater(0,0));
        oppType=random.nextInt(2);
        while (true){
            for (int r=0;r<5;r++){
                judge.add(random.nextInt(60)+10);
                opp.get(oppType).setMainArg(judge.get(0)+random.nextInt(18)-8);
                if(judge.get(0)>31){
                    judge.add(random.nextInt(60-(judge.get(0)-30))+10);
                }else{
                    judge.add(random.nextInt(60)+10);
                }
                opp.get(oppType).setValue(judge.get(0)+random.nextInt(18)-8);
                judge.add(100-judge.get(0)-judge.get(1));
                opp.get(oppType).setCrossX(judge.get(0)+random.nextInt(18)-8);

                judge.add(random.nextInt(50)+10);

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
                    paradigm=paradigm+"Also, I will be playing Clash of Clans during Cross-ex.";
                }

                System.out.println("Paradigm: (the standards the judge will weigh the debate on) \n"+paradigm);

                while(true){    
                    try{
                        System.out.println("Choose a debating style using one of the displayer integers: 1: Extinction links 2: Structural violence 3: Progressive kritiques and theory");
                        playerType=Integer.parseInt(input.nextLine())-1;
                        if (playerType>2 || playerType<0){
                            throw new IndexOutOfBoundsException("Number is out of range.");
                        }
                        System.out.println("How many points out of 100 of prepatory time do you wish to allocate to your value framework? (you will be splitting these points three ways) ");
                        player.get(playerType).setValue(Integer.parseInt(input.nextLine()));
                        System.out.println("How many points out of 100 of prepatory time do you wish to allocate towards Cross Examination? (you will be splitting these points three ways) ");
                        player.get(playerType).setCrossX(Integer.parseInt(input.nextLine()));
                        System.out.println("How many points out of 100 of prepatory time do you wish to allocate to your main argument and impact calculus? (you will be splitting these points three ways) ");
                        player.get(playerType).setMainArg(Integer.parseInt(input.nextLine()));
                        if(player.get(playerType).getCrossX()+player.get(playerType).getMainArg()+player.get(playerType).getValue()==100){
                        break;
                        }
                        System.out.println("please use a valid integer and ensure your inputted values sum to 100");
                    }catch(NumberFormatException | IndexOutOfBoundsException e){
                        System.out.println("please use a valid integer and ensure your inputted values sum to 100");
                    }
                }
                player.get(playerType).addPerks();
                
                System.out.println("Judge importance ratings (out of 100)");
                System.out.println("The main arguments/impact calc :" +judge.get(0));
                System.out.println("The value debate: " +judge.get(1));
                System.out.println("Cross Examination: " +judge.get(2));

                if(effectCalc(player.get(playerType).getCrossX(),judge.get(2)+effectCalc(player.get(playerType).getMainArg(),judge.get(0))+effectCalc(player.get(playerType).getValue(),judge.get(1)))<effectCalc(opp.get(oppType).getCrossX(),judge.get(2))+effectCalc(opp.get(oppType).getMainArg(),judge.get(0))+effectCalc(opp.get(oppType).getValue(),judge.get(1))){
                    System.out.println("You have won the round.");
                    player.get(playerType).setWins(1);
                }else{
                    System.out.println("You have lost the round.");
                }

                judge.clear();
                paradigm="Hello, if you are reading this, I am probably your judge, here's what I'm looking for: ";
            }
        switch(player.get(playerType).getWins()){
            case 4:
                System.out.println("You placed "+random.nextInt(2)+4+"th");
            case 5:
                System.out.println("You placed"+random.nextInt(3)+1+"th");
            default:
                System.out.println("You did not place.");
        }

        System.out.println("Do you want to play again? yes/no ");
        if(input.nextLine().equals("yes")){
            input.close();
            break;
        }
        player.get(playerType).reset();
        }
    }
    public static int effectCalc(int j, int p){
        return (j*p)*(Math.abs(p/j-1)+1);
    }
}
