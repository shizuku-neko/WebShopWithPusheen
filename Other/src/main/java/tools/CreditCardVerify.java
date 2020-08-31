package tools;

public class CreditCardVerify {
    public Integer CreditCard(Integer CreditCard) {
        String S = CreditCard.toString();
        int sum1 = 0, sum2 = 0;
        for (int i = S.length() - 1, j = 1; i >= 0; i--, j++) {
            if (j % 2 == 1)
                sum1 = sum1 + (S.charAt(i) - '0');
            else {
                int temp = (S.charAt(i) - '0') * 2;
                if (temp >= 10)
                    temp = temp - 9;
                sum2 = sum2 + temp;
            }
        }
        if ((sum1 + sum2) % 10 == 0) {
            return 1;
        } else {
            return -1;
        }
    }
}
