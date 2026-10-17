import java.util.ArrayList;
import java.util.List;

/**
 * Core Java module demonstrating robust software logic 
 * and object-oriented framework design for cash flow analysis.
 */
public class AssetValuation {
    
    private double principal;
    private double annualRate;
    private int maturityMonths;

    public AssetValuation(double principal, double annualRate, int maturityMonths) {
        this.principal = principal;
        this.annualRate = annualRate;
        this.maturityMonths = maturityMonths;
    }

    // Calculates simple compounded future value
    public double calculateFutureValue() {
        double monthlyRate = this.annualRate / 12.0;
        return this.principal * Math.pow(1 + monthlyRate, this.maturityMonths);
    }

    public static void main(String[] args) {
        AssetValuation loanAsset = new AssetValuation(1000000.0, 0.0825, 36);
        System.out.println(String.format("Calculated Asset Future Value: %.2f HUF", loanAsset.calculateFutureValue()));
    }
}
