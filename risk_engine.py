import numpy as np
import pandas as pd

class FinancialRiskEngine:
    """
    Quantitative Risk Engine for Asset-Liability Management (ALM)
    Demonstrates object-oriented programming (OOP) for banking risk analysis.
    """
    def __init__(self, portfolio_data: pd.DataFrame):
        self.portfolio = portfolio_data

    def calculate_weighted_duration(self) -> float:
        """Calculates the weighted average duration of the portfolio."""
        total_value = self.portfolio['Principal'].sum()
        weighted_dur = (self.portfolio['Principal'] * self.portfolio['Duration']).sum()
        return float(weighted_dur / total_value)

    def run_interest_rate_shock(self, shock_bps: int) -> float:
        """
        Simulates the impact of a parallel interest rate shock on the net portfolio value.
        shock_bps: Interest rate change in basis points (e.g., +200 bps)
        """
        shock_decimal = shock_bps / 10000.0
        weighted_duration = self.calculate_weighted_duration()
        total_value = self.portfolio['Principal'].sum()
        
        # Linear approximation of price change delta V = -V * D * delta y
        value_change = -1 * total_value * weighted_duration * shock_decimal
        return value_change

# Example initialization for testing
if __name__ == "__main__":
    sample_data = pd.DataFrame({
        'AssetID':,
        'Principal':,
        'Duration': [2.5, 4.0, 1.2]
    })
    engine = FinancialRiskEngine(sample_data)
    print(f"Portfolio Impact for +200bps shock: {engine.run_interest_rate_shock(200):,.2f} HUF")
