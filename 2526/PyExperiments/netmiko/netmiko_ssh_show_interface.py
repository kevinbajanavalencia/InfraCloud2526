print("Connecting via SSH => show interface status (brief)")
from netmiko import ConnectHandler
sshCli = ConnectHandler(
    device_type="cisco_ios",
    host="devnetsandboxiosxec9k.cisco.com",
    port="22",
    username="jade.piret",
    password="43JxCmOSInJU2_w_"
    )
output=sshCli.send_command("show ip interface brief")
print(output)