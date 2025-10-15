# 🏥 TibaBox

**TibaBox** is an **offline-first digital health and learning platform** that integrates **Bahmni**, **OpenMRS**, and **Internet-in-a-Box (IIAB)** to empower clinics, hospitals, and communities in low-connectivity regions.  
It enables **patient data management**, **telemedicine**, and **offline access to medical educational content**, all from a single local server.

---

## 🚀 Overview

TibaBox bridges the gap between healthcare delivery and health education in remote areas.

- 🩺 **Clinics & Hospitals** can manage patient records, laboratory results, pharmacy, billing, and reports using **Bahmni** and **OpenMRS**.
- 📚 **Communities & Patients** can access trusted medical content (videos, PDFs, images, guides) stored within the **IIAB digital library**—fully offline.
- 🌐 **Telemedicine Integration** allows remote consultation when Internet becomes available, ensuring continuity of care between rural clinics and urban specialists.

---

## 🧩 System Architecture

TibaBox combines the following open-source systems:

| Component | Purpose | Technology |
|------------|----------|-------------|
| **Internet-in-a-Box (IIAB)** | Offline content server and digital library | Debian/Ubuntu Server |
| **Bahmni** | Hospital Management and EMR | OpenMRS, OpenELIS, Odoo |
| **OpenMRS** | Core electronic medical records system | Java, Tomcat, MariaDB |
| **Telemedicine Module** | Remote doctor-patient consultation | WebRTC / WebSocket (optional) |
| **Tiba Content Portal** | Community access to medical digital resources | HTML / IIAB content services |

---

## 🛠️ Installation Guide

These instructions assume you have a running **IIAB instance** on Debian/Ubuntu Linux.

### 1. Install Java
```bash
sudo apt update
sudo apt install openjdk-11-jdk -y
java -version

2. Install and Start Tomcat 9
sudo apt install tomcat9 -y
sudo systemctl enable tomcat9
sudo systemctl start tomcat9

3. Deploy OpenMRS
cd /opt/tomcat9/webapps
sudo wget https://sourceforge.net/projects/openmrs/files/releases/OpenMRS_Platform_2.3.3/openmrs.war
sudo systemctl restart tomcat9


Then visit:
👉 http://localhost:8080/openmrs

4. Configure Database
sudo mysql -u root -p
CREATE DATABASE openmrs DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE USER 'openmrs_user'@'localhost' IDENTIFIED BY 'OpenmrsPass123';
GRANT ALL PRIVILEGES ON openmrs.* TO 'openmrs_user'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT;

5. Run OpenMRS Setup

Go to http://localhost:8080/openmrs

Select Simple Installation

Use your MySQL root credentials

Load demo data (optional)

Default credentials:

Username: admin

Password: Admin123

6. Integrate Bahmni Modules

Install Bahmni Apps, OpenELIS, and Odoo, and configure them to connect to your OpenMRS database as per Bahmni documentation.

🌍 Offline + Online Hybrid Use
Mode	Description
Offline Mode	Full access to patient EMR, pharmacy, lab, and educational resources without Internet.
Online Mode	Synchronizes data with cloud backups, enables teleconsultations, and pushes health reports to central servers.
📂 Directory Structure
/opt/tibabox/
├── iiab/               # Internet-in-a-Box core system
├── openmrs/            # OpenMRS and Bahmni services
├── content/            # Offline digital health library
├── telemedicine/       # Remote consultation module
└── docs/               # Deployment and training materials

🔒 Security and Privacy

Patient data stored locally and encrypted.

Access controlled via local authentication and user roles.

Optional VPN for secure remote doctor access.

Supports local-only operation to comply with data protection regulations.

💡 Future Enhancements

AI-powered triage and chatbot assistant (offline-first using local LLMs).

Integration with national health information systems (DHIS2, OpenHIM).

Mobile client app for community health workers.

Multilingual patient education content (Swahili, Somali, English).

👥 Contributors

Core Development:

TibaBox Health Innovation Team

Supported By:
Community health organizations and open-source contributors in Africa.

📜 License

TibaBox is released under the GNU General Public License v3.0 (GPL-3.0).

📧 Contact

For contributions, issues, or deployment support:
Email: abdihafid@tibabox.com

Website: www.tibabox.com
