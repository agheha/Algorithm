package mini.mani.mo;

import java.util.Arrays;

public class Solution {  /*참여자, 완주자.    완주하지 못한 사람이 한 명 있으니 찾자. */
    public String solution(String[] participant, String[] completion) {

    	Arrays.sort(participant);
    	Arrays.sort(completion);
    	
    	int i;
    	
    	for(i = 0; i < completion.length; i++) {
    		if (participant[i].equals(completion[i])) continue;
    		else return participant[i];
    	}
    	
    	return participant[i];
    }
}