using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class AboutMenuLogic : MonoBehaviour
{
    const string WebURL = "https://www.gatheringthevoices.com/";
    const string MainMenuScene = "MainMenu";

    public void OnBackButtonClick()
    {
        SceneManager.LoadSceneAsync(MainMenuScene);
    }

    public void OnVisitWebsiteClick()
    {
        Application.OpenURL(WebURL);
    }
}
