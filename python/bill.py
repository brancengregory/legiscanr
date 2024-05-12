import marvin
from pathlib import Path

class Bill(marvin.Model):
    title: str
    #policy_priorities: List[str]
    #policy_area_urls: List[HttpUrl]
    policy_topics: str
    summary: str
    #position: str
    #progress: str
    #status_this_session: str
    #expected_committees: List[str]
    #current_committee: str
    #past_committees: List[str]
    #org_lead: str
    #policy_lead_urls: List[HttpUrl]
    senate_authors: str
    house_authors: str
    #bill_link: HttpUrl
    #official_summary: str
    #related_bills: List[str]
    #internal_fact_sheet_urls: List[HttpUrl]
    #yes_votes: List[str]

# Read the content of the transcript
#transcript = Path("./text/House-of-Representatives-Second-Regular-Session-of-the-59th-Legislature-Day-47_2024-04-29-13.25.39_54431_2.txt").read_text()

transcript = """
Title: "HB 1777 (2023)"
Policy Priorities: ["Adult Fines and Fees Reduction"]
Policy Area:
URL: ["https://www.notion.so/1a67c99480c14b4fbb3db0147eebb0eb"]
URL: ["https://www.notion.so/529d914d2aa0429e8d4e3cd0528697cd"]
Policy Topics: ["Fines and Fees"]
Summary: "Eliminates court fees relating to the District Court Revolving Fund."
Position: "Support"
Progress: "3rd Reading - Opposite Chamber Committee"
Status This Session: "Alive"
Expected Committees: ["Senate - Appropriations", "Senate - Judiciary"]
Current Committee: "Senate - Judiciary"
Past Committees: ["House - A&B - Judiciary"]
Org. Lead: "Oklahomans for Criminal Justice Reform (OCJR)"
Policy Lead: ["https://www.notion.so/02a4dadc53964967bc6389bc5a3c0804"]
Senate Authors: ["Roger Thompson"]
House Authors: ["Danny Williams"]
Bill Link: ["http://www.oklegislature.gov/BillInfo.aspx?Bill=hb1777&Session=2300"]
Official Summary: "Court funds; court clerk's revolving fund; deleting fee amount; eliminating reference to District Court Revolving Fund; effective date; emergency."
Related Bills: ["HB 3497 (2024)"]
Internal Fact Sheet: ["https://www.notion.so/155766a986c849fe8cd615c158d45044"]
Yes Votes: ["Roger Thompson", "Robert Manger", "Jason Lowe", "Anthony Moore", "Jacob Rosecrants", "Collin Duel", "Danny Sterling"]
"""

res = marvin.extract(
  transcript,
  Bill
)

print(res)
