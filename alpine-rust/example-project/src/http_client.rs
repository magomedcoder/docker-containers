use log::{info, warn};
use serde::Deserialize;
use std::error::Error;

#[derive(Debug, Deserialize)]
pub struct ApiResponse {
    pub userId: i32,
    pub id: i32,
    pub title: String,
    pub body: String,
}

pub async fn fetch_example_data() -> Result<String, Box<dyn Error>> {
    info!("Отправка запроса к API...");
    
    let url = "https://jsonplaceholder.typicode.com/posts/1";
    let response = reqwest::get(url).await?;
    
    if !response.status().is_success() {
        warn!("API вернуло статус: {}", response.status());
        return Err("Не удалось получить данные".into());
    }
    
    let api_data: ApiResponse = response.json().await?;
    info!("Данные успешно получены: {:?}", api_data);
    
    Ok(format!("Пост #{}: {}", api_data.id, api_data.title))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[tokio::test]
    async fn test_fetch_example_data() {
        let result = fetch_example_data().await;
        assert!(result.is_ok());
    }
}