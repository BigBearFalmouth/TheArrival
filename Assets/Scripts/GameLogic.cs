using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
using UnityEngine.UI;

[RequireComponent(typeof(InkStoryManager))]
public class GameLogic : MonoBehaviour {

    public Animator InventoryAnimator;
    public bool ShowInventory = false;
    public InkStoryManager InkStoryManager;
    public Text StoryTextUI;
    public Button ChoiceButtonPrefab;
    public GameObject ButtonPanel;
    public Button ExitButton;

	// Use this for initialization
	void Start () {
        InkStoryManager = GetComponent<InkStoryManager>();	
	}

    public void ShowInventoryClicked()
    {
        ShowInventory = !ShowInventory;
        InventoryAnimator.SetBool("ShowPanel", ShowInventory);
    }

    private void Update()
    {
        while(InkStoryManager.CanContineStory())
        {
            string text = InkStoryManager.GetStoryContent();
            StoryTextUI.text = text;

            List<Choice> choices = InkStoryManager.GetChoices();
            if (choices.Count > 0)
            {
                
                for (int i = 0; i < choices.Count - 1; i++)
                {
                    Button button = Instantiate<Button>(ChoiceButtonPrefab);
                    button.GetComponentInChildren<Text>().text = choices[i].text;
                    button.onClick.AddListener(() => OnClickButton(choices[i]));
                    button.transform.SetParent(ButtonPanel.transform, false);
                    //ChoiceButtons[i].onClick.RemoveAllListeners();
                    //ChoiceButtons[i].onClick.AddListener(() => OnClickButton(choices[i]));
                    //ChoiceButtons[i].GetComponentInChildren<Text>().text = choices[i].text;
                }
                ExitButton.onClick.RemoveAllListeners();
                ExitButton.onClick.AddListener(() => OnClickButton(choices[choices.Count - 1]));
            }
        }
    }

    private void OnClickButton(Choice choice)
    {
        Debug.Log("Choice Picked" + choice.text);
        InkStoryManager.MakeChoice(choice.index);
        foreach (Transform child in ButtonPanel.transform)
        {
            Destroy(child.gameObject);
        }
        StoryTextUI.text = "";
    }
}
