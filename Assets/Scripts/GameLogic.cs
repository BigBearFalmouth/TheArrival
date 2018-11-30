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
    public Button ExitButton;
    public Button[] ChoiceButtons;
    public Button[] MapPinButtons;

    Dictionary<string, Texture> StoryBackgroundStates;
    public string CurrentStoryState;
    public List<Texture> StoryBackgrounds;

    Dictionary<string, Button> MapButtonsLookUp;
    public RawImage BackgroundImage;


	// Use this for initialization
	void Start () {
        InkStoryManager = GetComponent<InkStoryManager>();
        PopulateStoryStates();
        MapButtonsLookUp = new Dictionary<string, Button>();
        foreach(Button b in MapPinButtons)
        {
            MapButtonsLookUp[b.name] = b;
            b.gameObject.SetActive(false);
        }
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
        CheckState();
        if (CurrentStoryState=="Map")
        {
            OnMapState();
        }
        else
        {
            OnMenuStates();
        }
    }

    private void OnClickButton(GameChoice choice)
    {
        Debug.Log("Choice Picked " + choice.Name);
        InkStoryManager.MakeChoice(choice.Index);

        StoryTextUI.text = "";

    }

    void OnMapState()
    {

    }

    void OnMenuStates()
    {
        while (InkStoryManager.CanContineStory())
        {
            string text = InkStoryManager.GetStoryContent();
            StoryTextUI.text = text;

            List<Choice> choices = InkStoryManager.GetChoices();
            if (choices.Count > 0)
            {

                foreach (Button b in ChoiceButtons)
                {
                    b.gameObject.SetActive(false);
                }
                for (int i = 0; i < choices.Count - 1; i++)
                {
                    GameChoice currentChoice = new GameChoice
                    {
                        Name = choices[i].text,
                        Index = choices[i].index

                    };

                    Debug.Log(choices[i].pathStringOnChoice);
                    if (i < ChoiceButtons.Length)
                    {
                        Button button = ChoiceButtons[i];
                        button.gameObject.SetActive(true);
                        button.onClick.RemoveAllListeners();
                        button.GetComponentInChildren<Text>().text = choices[i].text;
                        button.onClick.AddListener(() => OnClickButton(currentChoice));
                    }
                }


                GameChoice exitChoice = new GameChoice
                {
                    Name = choices[choices.Count - 1].text,
                    Index = choices[choices.Count - 1].index

                };
                ExitButton.gameObject.SetActive(true);
                ExitButton.onClick.RemoveAllListeners();
                ExitButton.onClick.AddListener(() => OnClickButton(exitChoice));
            }
        }
    }
}
