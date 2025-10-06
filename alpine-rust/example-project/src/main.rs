use clap::{Arg, Command};
use log::{info, error};
use std::error::Error;

mod cli;
mod http_client;

#[tokio::main]
async fn main() -> Result<(), Box<dyn Error>> {
    env_logger::init();
    
    let matches = Command::new("Example Rust Project")
        .version("0.1.0")
        .author("Your Name <your.email@example.com>")
        .about("Пример Rust приложения для Docker")
        .arg(
            Arg::new("name")
                .short('n')
                .long("name")
                .value_name("NAME")
                .help("Устанавливает имя для приветствия")
                .default_value("World")
        )
        .arg(
            Arg::new("fetch")
                .short('f')
                .long("fetch")
                .help("Получить данные с API")
                .action(clap::ArgAction::SetTrue)
        )
        .get_matches();

    if let Some(name) = matches.get_one::<String>("name") {
        info!("Привет, {}!", name);
        println!("Привет, {}!", name);
    }

    if matches.get_flag("fetch") {
        info!("Выполнение HTTP запроса...");
        match http_client::fetch_example_data().await {
            Ok(data) => {
                info!("Данные получены успешно");
                println!("Полученные данные: {}", data);
            }
            Err(e) => {
                error!("Ошибка при получении данных: {}", e);
                eprintln!("Ошибка: {}", e);
            }
        }
    }

    cli::show_info();

    Ok(())
}