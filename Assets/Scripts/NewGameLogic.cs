using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class NewGameLogic : MonoBehaviour
{
    const string GameLevelName = "Game";

    public int PlayerAge;
    public string PlayerName;

    public void OnStartGameClick()
    {
        SceneManager.LoadSceneAsync(GameLevelName);
    }

    public void OnPlayerNameEntered(string name)
    {
        PlayerName = name;
    }

    public void OnPlayerAgeEntered(string age)
    {
        PlayerAge = int.Parse(age);
    }
}
