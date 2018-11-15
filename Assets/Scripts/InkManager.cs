using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
using UnityEngine.UI;
using System;

public class InkManager : MonoBehaviour {

    public TextAsset inkAsset;
    public Button buttonPrefab;
    public Text textPrefab;
    public Canvas canvas;

    Story inkStory;

    private void Awake()
    {
        inkStory = new Story(inkAsset.text);
    }

	
	// Update is called once per frame
	void Update ()
    {
	    while (inkStory.canContinue)
        {
            Text storyText = Instantiate<Text>(textPrefab);
            storyText.text = inkStory.Continue();

            Debug.Log("Story"+storyText.text);

            storyText.transform.SetParent(canvas.transform, false);
            if (inkStory.currentChoices.Count > 0)
            {
                for (int i = 0; i < inkStory.currentChoices.Count; i++)
                {
                    Choice choice = inkStory.currentChoices[i];
                    Button button = Instantiate<Button>(buttonPrefab);
                    button.GetComponentInChildren<Text>().text = choice.text;
                    button.onClick.AddListener(() => OnClickButton(choice));
                    Debug.Log("Choice" + choice.text);
                    button.transform.SetParent(canvas.transform, false);
                }
            }
        }

	}

    private void OnClickButton(Choice choice)
    {
        inkStory.ChooseChoiceIndex(choice.index);

        foreach(Transform child in canvas.transform)
        {
            Destroy(child.gameObject);
        }
    }
}
