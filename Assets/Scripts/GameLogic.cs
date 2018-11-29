using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
using UnityEngine.UI;

struct GameChoice
{
    public string Name;
    public int Index;
}


[RequireComponent(typeof(InkStoryManager))]
public class GameLogic : MonoBehaviour {

    public Animator InventoryAnimator;
    public bool ShowInventory = false;
    public InkStoryManager InkStoryManager;
    public Text StoryTextUI;
    public Button ChoiceButtonPrefab;
    public GameObject ButtonPanel;
    public Button ExitButton;

    Dictionary<string, Texture> StoryBackgroundStates;
    public string CurrentStoryState;
    public List<Texture> StoryBackgrounds;

    public RawImage BackgroundImage;


	// Use this for initialization
	void Start () {
        InkStoryManager = GetComponent<InkStoryManager>();
        PopulateStoryStates();

    }

    public void CheckState()
    {
        CurrentStoryState = InkStoryManager.GetVariableStateAsString("currentStoryState");
        BackgroundImage.texture = StoryBackgroundStates[CurrentStoryState];
    }

    public void PopulateStoryStates()
    {
        StoryBackgroundStates = new Dictionary<string, Texture>();
        InkList storyStateList=InkStoryManager.GetVariable("STORY_STATES") as InkList;
        int i = 0;
        foreach (var state in storyStateList.all.Keys)
        {
            StoryBackgroundStates[state.itemName] = StoryBackgrounds[i];
            i++;
        }
        CheckState();

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
            CheckState();

            List<Choice> choices = InkStoryManager.GetChoices();
            if (choices.Count > 0)
            {
                for (int i = 0; i < choices.Count - 1; i++)
                {
                    GameChoice currentChoice = new GameChoice
                    {
                        Name = choices[i].text,
                        Index = choices[i].index
                        
                    };


                    Button button = Instantiate<Button>(ChoiceButtonPrefab);
                    button.GetComponentInChildren<Text>().text = choices[i].text;
                    button.onClick.AddListener(() => OnClickButton(currentChoice));
                    button.transform.SetParent(ButtonPanel.transform, false);
                }

                GameChoice exitChoice = new GameChoice
                {
                    Name = choices[choices.Count - 1].text,
                    Index = choices[choices.Count - 1].index

                };
                ExitButton.onClick.RemoveAllListeners();
                ExitButton.onClick.AddListener(() => OnClickButton(exitChoice));
            }
        }
    }

    private void OnClickButton(GameChoice choice)
    {
        Debug.Log("Choice Picked " + choice.Name);
        InkStoryManager.MakeChoice(choice.Index);
        foreach (Transform child in ButtonPanel.transform)
        {
            Destroy(child.gameObject);
        }
        StoryTextUI.text = "";

    }
}
