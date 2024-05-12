import sys
from openai import OpenAI
from pydub import AudioSegment

client = OpenAI()

def split_audio(audio_file_path, chunk_length_ms=30000):
    """Split the audio file into chunks of a given length."""
    audio = AudioSegment.from_file(audio_file_path)
    return [audio[i:i + chunk_length_ms] for i in range(0, len(audio), chunk_length_ms)]

def transcribe_audio_chunks(chunks):
    """Transcribe each chunk of audio."""
    transcription = ""
    for i, chunk in enumerate(chunks):
        chunk_file = f'chunk{i}.wav'
        chunk.export(chunk_file, format="wav")

        with open(chunk_file, 'rb') as audio_file:
            response = client.audio.transcriptions.create(
              model="whisper-1",
              file=audio_file
            )
            transcription += response.text + " "
            
        os.remove(chunk_file)
        
    return transcription.strip()

def transcribe_audio(audio_file_path):
    """Main function to handle the transcription process."""
    chunks = split_audio(audio_file_path)
    return transcribe_audio_chunks(chunks)
