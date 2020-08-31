package tools;

public class CreditCardVerify {
    public Integer CreditCard(String CreditCard) {
        char[] chars = CreditCard.toCharArray();
        int odd = 0;
        int even = 0;
        for (int i = chars.length - 1; i >= 0; ) {
            //把字符转化成int，先调用抽象方法，放回String，在把String转换为int，或者是强转，但是字符只能为1位
            odd += Integer.parseInt(String.valueOf(chars[i]));
            //如果大于10
            //当前偶数
            //如果当前为最后一位,偶数啥事不干
            if (i == 0) {

            } else {
                int currEven = Integer.parseInt(String.valueOf(chars[i - 1]));
                //如果当前偶数的两倍>=10
                if (currEven * 2 >= 10) {
                    even += currEven * 2 - 9;
                } else {
                    even += currEven * 2;
                }
            }
            i -= 2;
        }
        if ((even + odd) % 10 == 0) {
            return 1;
        } else {
            return -1;
        }
    }
}
