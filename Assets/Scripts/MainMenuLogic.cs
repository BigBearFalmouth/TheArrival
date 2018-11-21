using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class MainMenuLogic : MonoBehaviour
{
    public void OnStartClicked()
    {
        SceneManager.LoadSceneAsync("Start");
    }

    public void OnAboutClicked()
    {
        SceneManager.LoadSceneAsync("About");
    }
}
