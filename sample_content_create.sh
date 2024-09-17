#!/bin/bash

# Array of question details: [FileName (tech term) | Title | Scenario | Options | Answer | Explanation]
questions=(
    "abuse_elevation_control_mechanism|The Sneaky Bribe|A new shop owner (developer) opens their store in the mall (cloud). However, instead of following proper procedures, they bribe a security guard (IAM system) to get access to restricted areas of the mall and steal items from other stores (apps).|Abuse Elevation Control Mechanism|Account Manipulation|Privilege Escalation|Command and Scripting Interpreter|A|This scenario demonstrates **Abuse Elevation Control Mechanism**. In this case, the shop owner (developer) is bypassing proper security controls to access areas they shouldn’t. In cloud environments, this technique involves abusing privileged roles or permission settings to elevate an attacker’s access. For more details, visit [MITRE ATT&CK: Abuse Elevation Control Mechanism](https://attack.mitre.org/techniques/T1548/)."
    "phishing|Fake Sale Sign Frenzy|A customer (user) is walking through the mall (cloud) when they spot a large sign that looks like it’s from their favorite shop (app). The sign promises a massive sale, and it points them to another part of the mall. Excited, they follow the sign, but instead of arriving at their favorite store, they end up in a fake shop set up to steal their wallet.|Exploiting Public-Facing Application|Phishing|Trusted Relationship|Account Manipulation|B|This scenario represents **Phishing**. Just like in the mall, where the customer is tricked by a misleading sign into entering a fake store, phishing involves deception to lead users into providing sensitive information. Learn more about phishing tactics at [Phishing Tactics](https://attack.mitre.org/techniques/T1566/)."
    "impair_defenses|Disabling the CCTV Drama|A shop owner (developer) wants to stay under the radar while making changes in their store. They disable the CCTV cameras (cloud monitoring tools) in their section of the mall (cloud) to ensure no one can see what they’re doing.|Hide Artifacts|Impair Defenses|Modify Cloud Compute Infrastructure|Modify Authentication Process|B|This scenario demonstrates **Impair Defenses**. In this case, the shop owner disables security cameras (monitoring tools) to hide their activities. In cloud security, attackers often disable or tamper with logging and monitoring systems. Code snippet example: \n\`\`\`\n# Disable logging\nlog.disable()\n\`\`\`\n Find out more at [Impair Defenses - MITRE ATT&CK](https://attack.mitre.org/techniques/T1562/)."
    "credential_access|Steal the Keycard|A thief sneaks into the mall’s (cloud) security office and steals a keycard (user credentials) to unlock all the stores (apps) in the mall.|Brute Force|Credentials from Password Stores|Use Alternate Authentication Material|Modify Authentication Process|B|This scenario shows **Credentials from Password Stores**. Stealing credentials from a key system allows the thief to unlock restricted areas (cloud apps). Protect against these attacks by using multi-factor authentication (MFA). More info: [MITRE ATT&CK: Credential Access](https://attack.mitre.org/techniques/T1552/)."
    "account_discovery|Find the Hidden Shops|A customer (attacker) walks through the mall (cloud), asking every store if they belong to a VIP club (cloud resources) to figure out which stores have secret access areas.|Account Discovery|Cloud Infrastructure Discovery|Cloud Storage Discovery|Network Service Discovery|A|This is an example of **Account Discovery**. The attacker is looking for privileged accounts in the cloud infrastructure. Quote from [MITRE ATT&CK](https://attack.mitre.org/techniques/T1087/): _'Adversaries may attempt to get a listing of domain or cloud accounts to identify users or groups with elevated privileges.'_"
    "internal_spearphishing|Insider Sale Lead|A mall employee (internal actor) sends an email to other mall workers (cloud users), pretending it’s a special offer, but the email contains a malicious link to steal their information.|Internal Spearphishing|Remote Services|Software Deployment Tools|Spearphishing Link|A|This scenario represents **Internal Spearphishing**. Attackers within an organization can send targeted emails to other users, pretending to be legitimate offers. Learn more about spearphishing from [Spearphishing Insights](https://attack.mitre.org/techniques/T1534/)."
    "data_exfiltration|Steal the Blueprints|A shop owner (developer) secretly copies the blueprint of another store (data) and mails it out (exfiltrates) through a secret delivery service.|Exfiltration Over Alternative Protocol|Exfiltration Over Web Service|Transfer Data to Cloud Account|Exfiltration Over Physical Medium|C|This scenario explains **Transfer Data to Cloud Account**. Attackers can secretly copy data and exfiltrate it to an external cloud account. It's essential to monitor suspicious data transfers. Visit [MITRE ATT&CK: Data Exfiltration](https://attack.mitre.org/techniques/T1537/)."
    "resource_hijacking|Free Ride|A group of teenagers (attackers) sneak into the mall’s (cloud) power room and use the mall’s electricity (cloud resources) to charge their devices (cryptocurrency mining).|Account Access Removal|Data Destruction|Data Encrypted for Impact|Resource Hijacking|D|This scenario demonstrates **Resource Hijacking**. Attackers use cloud resources like CPU or memory for their purposes, like cryptocurrency mining. Prevent this by monitoring cloud resource usage. More at [Resource Hijacking - MITRE ATT&CK](https://attack.mitre.org/techniques/T1496/)."
    "network_sniffing|Listening to Conversations|A mall security officer (attacker) sets up hidden microphones in various stores (apps) to listen in on private customer conversations (data packets).|Brute Force|Credentials from Password Stores|Network Sniffing|Network Service Discovery|C|This scenario explains **Network Sniffing**. Attackers intercept data packets by monitoring network traffic. This can reveal sensitive information like user credentials. Use encryption to protect against this. Read more at [MITRE ATT&CK: Network Sniffing](https://attack.mitre.org/techniques/T1040/)."
    "log_enumeration|Checking the Receipts|After making purchases (user activity), a mall employee (admin) checks every store’s receipts (logs) to see if anything suspicious happened.|Log Enumeration|Cloud Infrastructure Discovery|Account Discovery|Cloud Service Discovery|A|This scenario describes **Log Enumeration**. In cloud environments, admins frequently check logs for unusual activity or errors. A best practice is to continuously monitor logs and flag anomalies."
)

# Create a "questions" folder if it doesn't exist
mkdir -p questions

# Loop through the array and generate markdown files
for question in "${questions[@]}"; do
    # Split the question details using '|' as the delimiter
    IFS='|' read -r file_name title scenario option1 option2 option3 option4 answer explanation <<< "$question"
    
    # Generate markdown content
    cat <<EOL > "questions/${file_name}.md"
# ${title}

**Scenario:**

${scenario}

**What technique is being used here?**

**Options:**

- A) ${option1}
- B) ${option2}
- C) ${option3}
- D) ${option4}

**Answer:**

${answer}

**Explanation:**
${explanation}
EOL

done

echo "10 Markdown files generated in the 'questions' directory."