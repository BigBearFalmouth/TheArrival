using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;

public class InkStoryManager : MonoBehaviour
{
    Story inkStory;
    public TextAsset inkAsset;

    private void Awake()
    {
        inkStory = new Story(inkAsset.text);
    }

    public object GetVariable(string name)
    {
        return inkStory.variablesState[name];
    }

    public bool CanContineStory()
    {
        return inkStory.canContinue;
    }

    public string GetStoryContent()
    {
        return inkStory.ContinueMaximally();
    }

    public bool ChoicesAvaible()
    {
        return inkStory.currentChoices.Count > 0;
    }

    public List<Choice> GetChoices()
    {
        return inkStory.currentChoices;
    }

    public void MakeChoice(int choiceID)
    {
        inkStory.ChooseChoiceIndex(choiceID);
    }

    public string GetVariableStateAsString(string variableName)
    {
        return inkStory.variablesState[variableName].ToString();
    }

    public object GetVariableState(string variableName)
    {
        return inkStory.variablesState[variableName];
    }


}
