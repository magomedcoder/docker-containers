use log::info;
use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
pub struct AppConfig {
    pub name: String,
    pub version: String,
}

pub fn show_info() {
    let config = AppConfig {
        name: "Example Project".to_string(),
        version: "0.1.0".to_string(),
    };
    
    info!("Конфигурация приложения: {:?}", config);
    println!("Запущено приложение: {} v{}", config.name, config.version);
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_config_creation() {
        let config = AppConfig {
            name: "Test".to_string(),
            version: "1.0.0".to_string(),
        };
        
        assert_eq!(config.name, "Test");
        assert_eq!(config.version, "1.0.0");
    }
}